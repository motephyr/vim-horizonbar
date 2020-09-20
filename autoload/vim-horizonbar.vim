
func! BarWidth()
  let lessLength = winwidth('$') - (len(expand('%:t'))+len(&filetype)+ len(line('$'))*2+31)
  return line('$') > winheight('%') ? lessLength : line('$')*lessLength/winheight('%')
endfun


func! GetDiffList()
  let cmd = "git diff --unified=0 ".expand('%')." | sed -n -e 's/^.*+\\([0-9]*\\)\\([ ,]\\).*/\\1/p' | awk 'NF > 0'"
  "sed -n -e 's/^.*+\([0-9]*\)\([ ,]\).*/\1/p' | awk 'NF > 0'
  let b:difflist = systemlist(cmd)
endfun

func! ScrollBarWidth(barWidth)
  if a:barWidth > 3 
    let left = (line('$') - line('w0') >= winheight('%')) ? (line('w0') - 1) *a:barWidth/line('$') : (line('$') - winheight('%'))*a:barWidth/line('$') 
    let front = line('$') > line('w$') ? left : left + 1
    let scroll = (winheight('%')*a:barWidth/line('$') > 1) ? winheight('%')*a:barWidth/line('$') : 1

    let s = GetPosition(front, scroll, a:barWidth)
    return '['.s.']'
  else
    return ''
  endif
endfun

func! GetPosition(front, scroll,  barWidth)
  let c = ''
  let n = 1
  while n <= a:barWidth
    if index(TransDiffList(a:barWidth), n) >= 0
      let c .= '|'
    elseif n >= a:front && n <= a:front+a:scroll 
      let c .= '-'
    else
      let c .= ' '
    endif
    let n += 1
  endwhile
  return c
endfun

func! TransDiffList(barWidth)
  let nlist = []
  if exists("b:difflist")
    for l in b:difflist
      let nlist = add(nlist, str2nr(l)*a:barWidth/line('$'))
    endfor
  endif
  return nlist
endfun

fun! CaptureClickStatusLine(position)
  let line = line('$')/winheight('%') 
  if a:position == 'down'
    let aline = line('.') + line
  else
    let aline = line('.') - line
  endif
  return aline.'G'
endfun


