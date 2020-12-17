const String uploadFile = """
  mutation uploadRequestedFile(\$requestedFileId: ID!, \$file: Upload!) {
    uploadRequestedFile(requestedFileId: \$requestedFileId, file: \$file) {
      id
      documentUrl
    }
  }
""";
