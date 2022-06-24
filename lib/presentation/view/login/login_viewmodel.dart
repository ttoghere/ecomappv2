import 'dart:async';

import 'package:ecomappv2/domain/domain_shelf.dart';
import 'package:ecomappv2/presentation/base/base_shelf.dart';
import 'package:ecomappv2/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  StreamController userNameSC = StreamController<String>.broadcast();
  StreamController passwordSC = StreamController<String>.broadcast();
  var loginObject = LoginObject(
    username: "username",
    password: "password",
  );
  StreamController isAllInputsValidSC = StreamController<void>.broadcast();
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase);
  //İnputs

  @override
  void dispose() {
    isAllInputsValidSC.close();
    userNameSC.close();
    passwordSC.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => passwordSC.sink;

  @override
  Sink get inputUserNamse => userNameSC.sink;

  @override
  Sink get inputIsAllInputValid => isAllInputsValidSC.sink;

  @override
  login() async {
    (await loginUseCase.execute(LoginUseCaseInput(
      email: loginObject.username,
      password: loginObject.password,
    )))
        .fold(
      (failure) => {
        //Left = Hata
        print(failure.message)
      },
      (data) => {
        //Right = Başarılı
        print(data.customer?.name)
      },
    );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
      password: password,
    ); //Veri Yönetimi Kullanımı
    _validate();
  }

  @override
  setUserName(String username) {
    inputUserNamse.add(username);
    loginObject = loginObject.copyWith(
      username: username,
    );
    _validate();
  }

  //Outputs

  @override
  Stream<bool> get outputIsAllInputsValid =>
      isAllInputsValidSC.stream.map((validation) => _isInputsValid(validation));

  @override
  Stream<bool> get outputIsPasswordValid =>
      passwordSC.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid =>
      userNameSC.stream.map((username) => _isUserNameValid(username));

  //Gizli Fonksiyonlar
  _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  _isUserNameValid(String username) {
    return username.isNotEmpty;
  }

  _isInputsValid(validation) {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.username);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }
}

abstract class LoginViewModelInputs {
  //Fonksiyonlar
  setUserName(String username);
  setPassword(String password);
  login();
  //Sinkler
  Sink get inputUserNamse;
  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
