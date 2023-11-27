Import-Module posh-git
Import-Module posh-sshell
Import-Module PSFzf
Start-SshAgent -Quiet

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'Ctrl+u' -Function BackwardKillLine
Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord 'Control+LeftArrow' -Function BackwardWord
Set-PSReadLineKeyHandler -Chord 'Control+RightArrow' -Function ForwardWord
# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }


oh-my-posh init pwsh | Invoke-Expression

# Invoke-Expression "$PSScriptRoot\aliases.ps1"
Set-Alias -Name msbuild -Value 'C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe'



function Get-GitMainBranch {
    # Check if we are in a git repository
    $gitDir = git rev-parse --git-dir
    if ($LastExitCode -ne 0) { return }

    # Define the list of branch names to check
    $branchNames = @('main', 'trunk', 'mainline', 'default', 'master')

    # Check local branches first
    foreach ($branch in $branchNames) {
        if (git show-ref -q --verify "refs/heads/$branch") {
            return $branch
        }
    }

    # Check remote branches (origin and upstream)
    foreach ($remote in @('origin', 'upstream')) {
        foreach ($branch in $branchNames) {
            if (git show-ref -q --verify "refs/remotes/$remote/$branch") {
                return $branch
            }
        }
    }

    # Default to 'master' if no other branch is found
    return 'master'
}

function Get-GitCurrentBranch {
    try {
        $ref = git symbolic-ref --quiet HEAD 2>$null
        if (-not $ref) {
            $ref = git rev-parse --short HEAD 2>$null
        }
        return $ref -replace 'refs/heads/', ''
    } catch {
        return $null
    }
}

function Get-GitDevelopBranch {
    $gitDir = git rev-parse --git-dir
    if ($LastExitCode -ne 0) { return }

    $branchNames = @('dev', 'devel', 'develop', 'development')

    foreach ($branch in $branchNames) {
        if (git show-ref -q --verify "refs/heads/$branch") {
            return $branch
        }
    }

    return 'develop'
}

function g { git }
function ga { git add }
function gaa { git add --all }
function gam { git am }
function gama { git am --abort }
function gamc { git am --continue }
function gams { git am --skip }
function gamscp { git am --show-current-patch }
function gap { git apply }
function gapa { git add --patch }
function gapt { git apply --3way }
function gau { git add --update }
function gav { git add --verbose }
function gb { git branch }
function gbD { param($branch); git branch --delete --force $branch }
function gba { git branch --all }
function gbd { param($branch); git branch --delete $branch }
function gbg { git branch -vv | Select-String ": gone]" }
function gbgD {
    git branch --no-color -vv | Select-String ": gone]" | ForEach-Object {
        $_ -replace '^\*?\s+([^\s]+).*$', '$1'
    } | ForEach-Object {
        git branch -D $_
    }
}
function gbgd {
    git branch --no-color -vv | Select-String ": gone]" | ForEach-Object {
        $_ -replace '^\*?\s+([^\s]+).*$', '$1'
    } | ForEach-Object {
        git branch -d $_
    }
}
function gbl { param($file); git blame -w $file }
function gbm { param($oldName, $newName); git branch --move $oldName $newName }
function gbnm { git branch --no-merged }
function gbr  { git branch --remote }
function gbs  { git bisect }
function gbsb { git bisect bad }
function gbsg { git bisect good }
function gbsn { git bisect new }
function gbso { git bisect old }
function gbsr { git bisect reset }
function gbss { git bisect start }
# Set-Alias -Name gc -Value 'git commit --verbose'
function gce { git commit --verbose --amend }
function gca { git commit --verbose --all }
function gcae { git commit --verbose --all --amend }
function gcam { param($message); git commit --all --message $message }
function gcane { git commit --verbose --all --no-edit --amend }
function gcanse { git commit --verbose --all --signoff --no-edit --amend }
function gcas { git commit --all --signoff }
function gcasm { param($message); git commit --all --signoff --message $message }
function gcb { param($branchName); git checkout -b $branchName }
function gcd { git checkout (Get-GitDevelopBranch) }
function gcf  { git config --list }
function gcl { param($url); git clone --recurse-submodules $url }
function gclean { git clean --interactive -d }
function gcm { git checkout (Get-GitMainBranch) }
function gcmsg { param($message); git commit --message $message }
function gcne { git commit --verbose --no-edit --amend }
function gco { git checkout }
function gcor { git checkout --recurse-submodules }
function gcount { git shortlog --summary --numbered }
function gcp { git cherry-pick }
function gcpa { git cherry-pick --abort }
function gcpc { git cherry-pick --continue }
# function gcs  'git commit --gpg-sign'
function gcsm { param($message); git commit --signoff --message $message }
function gcss { git commit --gpg-sign --signoff }
function gcssm { param($message); git commit --gpg-sign --signoff --message $message }
function gd { git diff }
function gdca { git diff --cached }
function gdct { git describe --tags $(git rev-list --tags --max-count=1) }
function gdcw { git diff --cached --word-diff }
function gds { git diff --staged }
function gdt { git diff-tree --no-commit-id --name-only -r }
function gdup { git diff '@{upstream}' }
function gdw { git diff --word-diff }
function gf { git fetch }
function gfa { git fetch --all --prune --jobs=10 }
function gfg { param($pattern); git ls-files | Select-String $pattern }
function gfo { git fetch origin }
function gg { git gui citool }
function gga { git gui citool --amend }
function ggpull { git pull origin (Get-GitCurrentBranch) }
function ggpush { git push origin (Get-GitCurrentBranch) }
function ggsup { git branch --set-upstream-to=origin/(Get-GitCurrentBranch) }
function ghh { git help }
function gignore { git update-index --assume-unchanged }
function gignored { git ls-files -v | Select-String "^[[:lower:]]" }
function git-svn-dcommit-push { git svn dcommit; git push github (Get-GitMainBranch):svntrunk }
# function gl  'git pull'
function glg { git log --stat }
function glgg { git log --graph }
function glgga { git log --graph --decorate --all }
function glgm { git log --graph --max-count=10 }
function glgp { git log --stat --patch }
function glo { git log --oneline --decorate }
function glod { git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" }
function glods { git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short }
function glog { git log --oneline --decorate --graph }
function gloga  { git log --oneline --decorate --graph --all }
function glol { git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" }
function glola { git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all }
function glols { git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat }
function gluc { git pull upstream (Get-GitCurrentBranch) }
function glum { git pull upstream (Get-GitMainBranch) }
function gme { git merge }
function gma { git merge --abort }
function gmom { git merge origin/(Get-GitMainBranch) }
function gms { git merge --squash }
function gmtl { git mergetool --no-prompt }
function gmtlvim { git mergetool --no-prompt --tool=vimdiff }
function gmum { git merge upstream/(Get-GitMainBranch) }
function gpu { git push }
function gpcpr { git push 2>&1 | Select-String 'https' | ForEach-Object { $_ -split ' ' }[1] | ForEach-Object { Start-Process $_ } }
function gpd { git push --dry-run }
function gpf { git push --force-with-lease --force-if-includes }
# function 'gpf!' { git push --force }
function gpoat { git push origin --all; git push origin --tags }
function gpd { param($branch); git push origin --delete $branch }
function gpr  { git pull --rebase }
function gpra  { git pull --rebase --autostash }
function gprav  { git pull --rebase --autostash -v }
function gpristine { git reset --hard; git clean --force -dfx }
function gprom { git pull --rebase origin (Get-GitMainBranch) }
function gpromi { git pull --rebase=interactive origin (Get-GitMainBranch) }
function gprv { git pull --rebase -v }
function gpsup { git push --set-upstream origin (Get-GitCurrentBranch) }
function gpsupf { git push --set-upstream origin (Get-GitCurrentBranch) --force-with-lease --force-if-includes }
function gpu { git push upstream }
function gpuv  { git push --verbose }
function gr  { git remote }
function gra { param($name, $url); git remote add $name $url }
function grb  { git rebase }
function grba { git rebase --abort }
function grbc { git rebase --continue }
function grbd { git rebase (Get-GitDevelopBranch) }
function grbi  { git rebase --interactive }
function grbm { git rebase (Get-GitMainBranch) }
function grbo { param($branch); git rebase --onto $branch }
function grbom { git rebase origin/(Get-GitMainBranch) }
function grbs  { git rebase --skip }
function grev  { git revert }
function grh  { git reset }
function grhh  { git reset --hard }
function grhk  { git reset --keep }
function grhs  { git reset --soft }
function grm { param($file); git rm $file }
function grmc { param($file); git rm --cached $file }
function grmv { param($oldName, $newName); git remote rename $oldName $newName }
function groh { git reset origin/(Get-GitCurrentBranch) --hard }
function grrm { param($name); git remote remove $name }
function grs  { git restore }
function grset { param($name, $url); git remote set-url $name $url }
function grss { param($source); git restore --source $source }
function grst  { git restore --staged }
function gru  { git reset -- }
function grup  { git remote update }
function grv  { git remote --verbose }
function gsb  { git status --short --branch }
function gsd  { git svn dcommit }
function gsh  { git show }
function gsi  { git submodule init }
function gsps  { git show --pretty=short --show-signature }
function gsr  { git svn rebase }
function gss  { git status --short }
function gst  { git status }
function gsta { git stash push }
function gstaa { git stash apply }
function gstall { git stash --all }
function gstc  { git stash clear }
function gstd  { git stash drop }
function gstl  { git stash list }
function gstp { git stash pop }
function gsts  { git stash show --patch }
function gsu  { git submodule update }
function gsw  { git switch }
function gswc { param($branchName); git switch --create $branchName }
function gswd { git switch (Get-GitDevelopBranch) }
function gswm { git switch (Get-GitMainBranch) }
function gta { param($tag, $message); git tag --annotate $tag -m $message }
function gts  { git tag --sign }
function gtv { git tag | Sort-Object -Version }
function gunignore { param($file); git update-index --no-assume-unchanged $file }
function gunwip { if (git rev-list --max-count=1 --format="%s" HEAD | Select-String "\--wip--") { git reset HEAD~1 } }
function gwch { git whatchanged -p --abbrev-commit --pretty=medium }
function gwip { 
    git add -A; 
    git rm $(git ls-files --deleted) 2> $null; 
    git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]" 
}
function gwt  { git worktree }
function gwta { param($path); git worktree add $path }
function gwtls  { git worktree list }
function gwtmv { param($oldPath, $newPath); git worktree move $oldPath $newPath }
function gwtrm { param($path); git worktree remove $path }

