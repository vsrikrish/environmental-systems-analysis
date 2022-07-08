function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end


function hw_badge(num, ftype)  
  if ftype == "html"
    link = string("/assignments/hw", num, "/hw", num, "/")
    alt_text = string("HW", num, " Web Instructions")
    badge_right = "web"
  elseif ftype == "pdf"
    link = string("/assignments/hw", num, "/hw", num, ".pdf")
    alt_text = string("HW", num, " PDF Instructions")
    badge_right = "pdf"
  end
  badge_left = string("HW", num)
  badge_url = string("https://img.shields.io/static/v1?label=", badge_left, "&message=", badge_right, "&color=b31b1b&labelColor=222222&style=flat")
  badge_string = string(
    "[!", "[", alt_text, "]", 
    "(", badge_url, ")", "]",
    "(", link, ")"
  )
  return badge_string
end

function rubric_badge(num, ftype)  
  if ftype == "html"
    link = string("/assignments/hw", num, "/rubric/")
    alt_text = string("HW", num, " Web Rubric")
    badge_right = "web"
  elseif ftype == "pdf"
    link = string("/assignments/hw", num, "/rubric.pdf")
    alt_text = string("HW", num, " PDF Rubric")
    badge_right = "pdf"
  end
  badge_left = "rubric"
  badge_url = string("https://img.shields.io/static/v1?label=", badge_left, "&message=", badge_right, "&color=b31b1b&labelColor=222222&style=social")
  badge_string = string(
    "[!", "[", alt_text, "]", 
    "(", badge_url, ")", "]",
    "(", link, ")"
  )
  return badge_string
end

function hfun_hw_badges(params) 
  num = params[1]
  io = IOBuffer()
  write(io, Franklin.fd2html("""
    @@badges
    $(hw_badge(0, "html"))
    $(hw_badge(0, "pdf"))
    @@
    """, internal=true)
  )
  return String(take!(io))
end

function hfun_rubric_badges(params) 
  num = params[1]
  io = IOBuffer()
  write(io, Franklin.fd2html("""
    @@badges
    $(rubric_badge(0, "html"))
    $(rubric_badge(0, "pdf"))
    @@
    """, internal=true)
  )
  return String(take!(io))
end
