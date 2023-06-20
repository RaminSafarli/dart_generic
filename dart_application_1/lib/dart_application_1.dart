//Generics

void main() {
  UserManager userManager = UserManager();
  userManager.addUser(Admin('Elovset', 'elovset20@mail.ru'));

  userManager.addUser(GeneralUser('Sureyya', 'sureyya99@gmail.com'));
  userManager.addUser(GeneralUser('Mensur', 'mensur25@bk.ru'));
  userManager.addUser(GeneralUser('Elmar', 'elmar15@yahoo.com'));

  userManager.emailsList().forEach((element) {
    print(element);
  });
}

class User {
  String name;
  String email;
  User(this.name, this.email);
}

class Admin extends User {
  Admin(super.name, super.email);
}

class GeneralUser extends User {
  GeneralUser(super.name, super.email);
}

class UserManager<T extends User> {
  List<T> userList = [];
  void addUser(T t) {
    userList.add(t);
  }

  void deleteUser(T t) {
    userList.remove(t);
  }

  List<String> emailsList() => userList
      .map((e) => e is Admin
          ? 'Admin mail: ${e.email.split('@')[1]}'
          : 'User name: ${e.name}, mail: ${e.email}')
      .toList();

  void emailsList2() {
    userList.forEach((e) {
      if (e is Admin) {
        print('Admin mail: ${e.email.split('@')[1]}');
      } else {
        print('User name: ${e.name}, mail: ${e.email}');
      }
    });
  }
}
