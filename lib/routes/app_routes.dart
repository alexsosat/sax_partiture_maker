part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const editor = _Paths.editor;
  static const viewer = _Paths.viewer;
  static const projects = _Paths.projects;
  static const settings = _Paths.settings;
}

abstract class _Paths {
  static const home = '/home';
  static const editor = '/editor';
  static const viewer = '/viewer';
  static const projects = '/projects';
  static const settings = '/settings';
}
