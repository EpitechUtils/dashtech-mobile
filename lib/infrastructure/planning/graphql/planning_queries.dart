const planningListWeekActivitiesQuery = """
  query planningListWeekActivities {
    planningListWeekActivities {
      date
      activities {
        scolaryear
        codemodule
        codeacti
        codeevent
        codeinstance
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

const planningWeekActivitiesQuery = """
  query planningWeekActivities(\$start: String! \$end: String!) {
    planningWeekActivities(start: \$start end: \$end) {
      date
      activities {
        scolaryear
        codemodule
        codeacti
        codeevent
        codeinstance
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

const planningActivityDetailsQuery = """
  query planningActivityDetails(\$codes: CodesInput!) {
    planningActivityDetails(codes: \$codes) {
      scolaryear
      codemodule
      codeinstance
      codeacti
      call_ihk
      slug
      instance_location
      module_title
      title
      description
      type_title
      type_code
      begin
      start
      end_register
      deadline
      end
      nb_hours
      nb_group
      num
      register
      register_by_bloc
      register_prof
      title_location_type
      is_projet
      id_projet
      project_title
      is_note
      nb_notes
      is_blocins
      rdv_status
      id_bareme
      title_bareme
      archive
      hash_elearning
      ged_node_adm
      nb_planified
      hidden
      project {
        id
        scolaryear
        codemodule
        codeinstance
        title
      }
      events {
        code
        num_event
        seats
        title
        description
        nb_inscrits
        begin
        end
        id_activite
        location
        nb_max_students_projet
        already_register
        user_status
        allow_token
      }
    }
  }
""";
