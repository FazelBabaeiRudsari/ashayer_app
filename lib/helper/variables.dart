class Variable {
  static String DOMAIN = "http://moj-raj.ir/";
  static String SCHOOLS = "${DOMAIN}schools/all";
  static String DROPDOWN = DOMAIN + "dropdown/";
  static String SEARCH = "${DOMAIN}search/";
  static String HOOZES = DOMAIN + "hoozes/";
  static String COMMAND_SCHOOLS = "schools";
  static String DISCONNECTED = "DISCONNECTED";

  static String COMMAND_REFRESH_SCHOOLS = "REFRESH_SCHOOLS";

  static String token = "";

  static Map<String, String> ERROR = {
    "DISCONNECTED": "اتصال برقرار نیست",
  };
}

enum Commands { RefreshSchools }
