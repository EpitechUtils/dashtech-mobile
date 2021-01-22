const String planningListWeekActivitiesQuery = """
  query planningListWeekActivities {
    planningListWeekActivities {
      date
      activities {
        codemodule
        codeacti
        codeevent
        semester
        title
        titlemodule
        acti_title
        total_students_registered
        start
        end
        nb_hours
        event_registered
        is_rdv
        type_title
        type_code
        room {
          code
          type
          seats
        }
      }
    }
  }
""";

const String planningDayActivitiesQuery = """
  query planningDayActivities(\$date: String!) {
    planningDayActivities(date: \$date) {
      codemodule
      codeacti
      codeevent
      semester
      title
      titlemodule
      acti_title
      total_students_registered
      start
      end
      nb_hours
      event_registered
      is_rdv
      type_title
      type_code
      room {
        code
        type
        seats
      }
    }
  }
""";
