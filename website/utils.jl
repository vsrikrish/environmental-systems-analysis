using YAML
using Dates

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
  badge_url = string("https://img.shields.io/static/v1?label=", badge_left, "&message=", badge_right, "&color=b31b1b&labelColor=222222&style=flat")
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
    $(hw_badge(num, "html"))
    $(hw_badge(num, "pdf"))
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
    $(rubric_badge(num, "html"))
    @@
    """, internal=true)
  )
  return String(take!(io))
end

function lecture_badge(num)  
  path_names = filter(isdir, readdir("_assets/lecture-notes"; join=true))
  lecture_path = filter(x -> contains(x, num), path_names)
  name = split(lecture_path[1], "-")[3]
  link = string("/", strip(lecture_path[1], '_'), "/index.html")
  alt_text = string(titlecase(name), " Notes")
  badge_right = "web"
  badge_left = "Notes"
  badge_url = string("https://img.shields.io/static/v1?label=", badge_left, "&message=", badge_right, "&color=b31b1b&labelColor=222222&style=flat")
  badge_string = string(
    "[!", "[", alt_text, "]", 
    "(", badge_url, ")", "]",
    "(", link, ")"
  )
  return badge_string
end

function hfun_lecture_badges(params::Vector{String}) 
  name = params[1]
  io = IOBuffer()
  write(io, Franklin.fd2html("""
    @@badges
    $(lecture_badge(name))
    @@
    """, internal=true)
  )
  return String(take!(io))
end

function project_badge(nm, ftype)  
  if ftype == "html"
    link = string("/assignments/", nm, "/")
    alt_text = string("Project", titlecase(nm), " Instructions")
    badge_right = "web"
  elseif ftype == "pdf"
    link = string("/assignments/", nm, "/$nm.pdf")
    alt_text = string("Project", titlecase(nm), " Instructions")
    badge_right = "pdf"
  end
  badge_left = "project"
  badge_url = string("https://img.shields.io/static/v1?label=", badge_left, "&message=", badge_right, "&color=b31b1b&labelColor=222222&style=flat")
  badge_string = string(
    "[!", "[", alt_text, "]", 
    "(", badge_url, ")", "]",
    "(", link, ")"
  )
  return badge_string
end


function hfun_day_schedule(params::Vector{String})
  path_to_yml = params[1]
  dname = params[2]
  sched = YAML.load_file(path_to_yml)["schedule"]
  d = filter(kv -> kv["name"] == dname, sched)[1]
  if haskey(d, "events")
    events = d["events"]
    # write the list
    io = IOBuffer()
    write(io, """<ul class="schedule-events" style="height: 790px">\n""")
    for event in events
      (name, location, start, finish) = values(event)
      if startswith(name, "Office Hours")
        slug = "office-hours"
      else
        slug = lowercase(name)
        replace(slug, " " => "-")
      end
      top = string(Int(round(Minute(Time(start, "II:MM p") - Time(8)).value * 4/3)), "px")
      height = string(Int(round(Minute(Time(finish, "II:MM p") - Time(start, "II:MM p")).value * 4/3)), "px")
      write(io, """<li class="schedule-event $slug" style="top: $top; height: $height">\n""")
      write(io, """<div class="name">$name</div>\n""")
      write(io, """<div class="time">$start-$finish</div>\n""")
      write(io, """<div class="location">$location</div>\n""")
      write(io, "</li>\n")
    end
    write(io, "</ul>\n")

    out = String(take!(io))
  else
    out = "\n"
  end
  return out
end