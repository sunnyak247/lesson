module PageHelper
#  def days_in_month(month, year = now.year)
#   if month == 2 && ::Date.gregorian_leap?(year)
#     29
#   else
#     COMMON_YEAR_DAYS_IN_MONTH[month]
#   end
#  end


  def calendar ( month, year )
    current_date = Date.new(year, month, 1 )

    prev_month = month - 1
    prev_year = year
    if( prev_month <= 0)
      prev_month = 12
      prev_year = prev_year - 1
    end

    next_month = month + 1
    next_year = year
    if ( next_month >= 13)
      next_month = 1
      next_year = next_year + 1
    end

#    day_of_month = '28..31'.to_i
#    month = '1..12'.to_i
#    case
#      when month == 2 then puts day_of_month = 28
#    when month == 4||6||9||11 then puts day_of_month = 30
#      else puts day_of_month = 31
#    end




    cal = ''                      # "/page/calendar?month=#{prev_month}&year=#{prev_year}
    cal += link_to("Prev", calendar_path(:month=> prev_month, :year => prev_year) )

    cal += current_date.strftime("%B")
                                  # "/page/calendar?month=#{next_month}&year=#{next_year}"
    cal += link_to("Next", calendar_path(:month=> next_month, :year => next_year) )

    day_of_week = current_date.strftime("%w").to_i
    a = (7 - day_of_week).to_i
    b = (a + 7).to_i
    c = (b + 7).to_i
    days_in_month =
    remaining_day_of_month = (31 - c - 7).to_i
    cal += "<table border='1'>\n\t<tr>\n"
    days = %w(Sun Mon Tue Wed Thu Fri Sat)
    days.each do | day |
      cal += "\t\t<td>#{day}</td>\n"
    end
    # Second row - first week of the month
    cal += "<tr>"
    day_of_week.times do
      cal += "<td>&nbsp;</td>"
    end
    # Print the days of week starting with 1
    (7 - day_of_week).times do |day|
      cal += "<td>#{day+1}</td>"
    end

    # Loop to do the in-between rows
    cal += "<tr>"
    7.times do
      cal += "<td>#{ a += 1 }</td>"
    end

    cal += "<tr>"
    7.times do
      cal += "<td>#{ b += 1 }</td>"
    end


    # Loop to do the last row

    cal += "<tr>"
    7.times do
      cal += "<td>#{ c += 1 }</td>"
    end

    cal += "<tr>"
    remaining_day_of_month.times do
      cal += "<td>#{ c += 1 }</td>"
    end


    cal += "</tr>"
    cal += "</tr>"
    cal += "</tr>"
    cal += "</tr>"
    cal += "\t</tr>\n</table>\n"
    cal += "Month: #{month}</br>Year: #{year}<br/>"
    cal += "Date: #{current_date}<br/>"
    cal += day_of_week.to_s
    return cal
  end
end
