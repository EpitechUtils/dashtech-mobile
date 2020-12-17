const String findTherapistJobBySectorOfActivity = """
  query findAllTherapistJob(\$sector: SectorOfActivity) {
    findAllTherapistJob(sector: \$sector) {
      id
      name
      requestedDocumentList {
        id
        documentKindId
        jobId
        isMandatory
        documentKind {
          id
          name
        }
      }
    }
  }
""";

const String findUserByAdeli = """
  query findUserByAdeli(\$adeli: String!) {
    findUserByAdeli(adeli: \$adeli) {
      firstName
      lastName
      job 
    }
  }
""";
