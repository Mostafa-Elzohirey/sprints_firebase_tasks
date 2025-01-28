mixin AppLocale {
  static const String title = 'title';
  static const String signUp = 'signUp';
  static const String email = 'email';
  static const String name = 'name';
  static const String password = 'password';
  static const String conPassword = 'conPassword';
  static const String acc = 'account';
  static const String cont = 'cont';
  static const String noMatch = 'noMatch';
  static const String entername = 'enterName';
  static const String entermail = 'enterMail';
  static const String enterpass = 'enterPass';
  static const String mailmust = 'mailMust';
  static const String passmust = 'passMust';
  static const String namemust1 = 'nameMust1';
  static const String namemust2 = 'nameMust2';
  static const String products = 'products';
  static const String offers = 'offers';
  static const String lang = 'lang';
  static const String english = 'english';
  static const String arabic = 'arabic';
  static const String logout = 'logout';
  static const String login = 'login';

  static const Map<String, dynamic> en = {
    title: 'Shopping App',
    signUp: 'sign up',
    email: 'E-mail',
    name: 'Name',
    password: 'Password',
    conPassword: 'Confirm password',
    products: 'Our Products',
    offers: 'Hot offers',
    lang: 'language',
    english: 'English',
    arabic: 'Arabic',
    acc: 'account created',
    cont: 'continue',
    noMatch: "passwords don't match",
    namemust1: 'name should start with a capital letter',
    namemust2: 'name should only contain letters',
    passmust: 'password should bbe more that 6 characters',
    mailmust: 'email should contain @',
    entername: 'please enter name',
    entermail: 'please enter E-mail',
    enterpass: 'please enter password',
    logout: 'logout',
    login: 'login'
  };
  static const Map<String, dynamic> ar = {
    title: 'تطبيق التسوق',
    signUp: 'تسجيل دخول',
    email: 'البريد الالكترونى',
    name: 'الاسم',
    password: 'كلمة المرور',
    conPassword: ' تاكيد كلمة المرور',
    products: 'منتجاتنا',
    offers: 'العروض',
    lang: 'اللغة',
    english: 'الانجليزية',
    arabic: 'العربية',
    acc: 'تم انشاء الحساب',
    cont: 'استمرار',
    noMatch: 'الكلمتان غير متطابقتان',
    namemust1: 'يجب ان يبدا الاسم بحرف كبير',
    namemust2: 'يجب ان يحتوي الاسم على حروف فقط',
    passmust: 'يجب ان تكون كلمة المرور اكتر من 6 شخصيات',
    mailmust: 'يجب ان يحتوي البريد الالكتروني علي @',
    entername: 'الرجاء ادخال الاسم',
    entermail: 'الرجاء ادخال البريد الالكتروني',
    enterpass: 'الرجاء ادخال كلمة مرور',
    logout: 'تسجيل جروج',
    login: 'تسجيل دخول',
  };
}
