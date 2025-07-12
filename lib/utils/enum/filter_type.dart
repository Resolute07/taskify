enum FilterType {
  all,
  active,
  completed;

  String get label {
    switch (this) {
      case FilterType.all:
        return 'All';
      case FilterType.active:
        return 'Active';
      case FilterType.completed:
        return 'Completed';
    }
  }
}
