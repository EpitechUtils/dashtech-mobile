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
        assistants {
          login
          title
          picture
          manager_status
        }
      }
    }
  }
""";

const planningRdvDetailsQuery = """
  query planningRdvDetails(\$codes: CodesInput!) {
    planningRdvDetails(codes: \$codes) {
      scolaryear
      codemodule
      codeinstance
      codeacti
 
      nb_notes
      register_by_bloc
      title
      description
      instance_location
      module_title
      student_registered
      with_project
      nb_registered
      nb_slots_full
      group {
        id
        code
        title
        inscrit
        master
        members
      }
      projects {
        title
        codeacti
        id_projet
      }
      events {
        id
        nb_registered
        begin
        register
        num_event
        end
        location
        title
        date_ins
        date_modif
      }
      project {
        id
        scolaryear
        codemodule
        codeinstance
        title
      }
      slots {
        id
        title
        bloc_status
        room
        codeevent
        slots {
          id
          acti_title
          date
          duration
          status
          bloc_status
          id_team
          id_user
          date_ins
          code
          title
          module_title
          members_pictures
          past
          master {
            login
            title
            picture
          }
          members {
            login
            title
            picture
          }
        }
      }
    }
  }
""";
