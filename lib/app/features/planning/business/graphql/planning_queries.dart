final String planningWeekActivities = """
  query planningWeekActivities {
    planningWeekActivities {
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
