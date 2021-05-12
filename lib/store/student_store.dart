import 'package:flutter/cupertino.dart';
import 'package:lecture2/models/sinhvien.dart';
import 'package:mobx/mobx.dart';

import '../Student_api.dart';

part 'student_store.g.dart';

class StudentStore = StudentStoreBase with _$StudentStore;

abstract class StudentStoreBase with Store {
  StudentApi studentApi = StudentApi();
  ReactionDisposer disposer;
  var pageController = PageController();

  void runReactionDisposer() {
    disposer = reaction((_) => listType, (result) {
      return result;
    });
  }

  void releaseReaction() {
    disposer();
  }

  @observable
  ObservableFuture<List<SinhVien>> students;
  bool listType = false;
  int selectedIndex = 0;

  @action
  Future fetchStudents() => students =
      ObservableFuture(studentApi.getPost().then((students) => students));

  void getStudents() {
    fetchStudents();
  }

  @action
  void changePage(int index) {
    pageController.jumpToPage(index);
    selectedIndex = index;
  }

  @action
  void changeListType() {
    listType = !listType;
  }
}


