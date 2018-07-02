import '../../model/user.dart';

class GetVerifyCodeAction {
  GetVerifyCodeAction(this.mobile);

  final String mobile;
}

class LoginWithVerifyCodeAction {}

class LoginWithThirdAction {}

//class ShowDatesUpdatedAction
//  final List<DateTime> dates;
//}
//
//class FetchShowsAction {
//  FetchShowsAction(this.theater);
//  final Theater theater;
//}
//
//class RequestingShowsAction {}
//
//class RefreshShowsAction {}
//
//class ReceivedShowsAction {
//  ReceivedShowsAction(this.theater, this.shows);
//
//  final Theater theater;
//  final List<Show> shows;
//}
//
//class ErrorLoadingShowsAction {}
//
//class ChangeCurrentDateAction {
//  ChangeCurrentDateAction(this.date);
//  final DateTime date;
//}
