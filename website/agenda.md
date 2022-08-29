@def week_days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

@@banner
# Weekly Schedule
@@

This schedule shows the typical weekly agenda for course-related events. Specifics are subject to change for a given date (for example, lectures will not be held on university holidays, and specific office hours may be changed), so make sure to check the [Ed Discussion board](https://edstem.org/us/courses/23643/discussion/) for announcements.

~~~
<div class="schedule">
    <ul class="schedule-times" style="min-width: 835px">
        <li class="schedule-time">8:00 AM</li>
        <li class="schedule-time">8:30 AM</li>
        <li class="schedule-time">9:00 AM</li>
        <li class="schedule-time">9:30 AM</li>
        <li class="schedule-time">10:00 AM</li>
        <li class="schedule-time">10:30 AM</li>
        <li class="schedule-time">11:00 AM</li>
        <li class="schedule-time">11:30 AM</li>
        <li class="schedule-time">12:00 PM</li>
        <li class="schedule-time">12:30 PM</li>
        <li class="schedule-time">1:00 PM</li>
        <li class="schedule-time">1:30 PM</li>
        <li class="schedule-time">2:00 PM</li>
        <li class="schedule-time">2:30 PM</li>
        <li class="schedule-time">3:00 PM</li>
        <li class="schedule-time">3:30 PM</li>
        <li class="schedule-time">4:00 PM</li>
        <li class="schedule-time">4:30 PM</li>
        <li class="schedule-time">5:00 PM</li>
        <li class="schedule-time">5:30 PM</li>
        <li class="schedule-time">6:00 PM</li>
    </ul>
    <ul class="schedule-days">
        {{ for day in week_days }}
        <li class="schedule-day">
            <h2 class="schedule-header">{{fill day }}</h2>
            {{ day_schedule _assets/schedule.yml {{ fill day }} }}
        </li>
        {{ end }}

    </ul>
</div>
~~~