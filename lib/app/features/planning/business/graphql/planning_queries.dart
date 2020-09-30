final String planningListActivities = """
  query planningListActivities {
    planningListActivities {
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

final String planningMonthActivities = """
  query planningMonthActivities {
    planningMonthActivities {
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
