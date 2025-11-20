import '../../models/activity.dart';
import '../services/activity_service.dart';

class ActivitiesController {
  final ActivityService _service = ActivityService();

  Future<List<Activity>> getActivities() {
    return _service.loadActivities();
  }

  Future<void> addActivity(Activity activity) {
    return _service.addActivity(activity);
  }
}
