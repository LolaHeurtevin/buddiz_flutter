import 'dart:convert'; // fourni json encode et jsonb  decole
import 'dart:io'; // permet la manipulatio des fichiers
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../models/activity.dart';

class ActivityService {
  // chemin vers le fichier local
  Future<File> _localFile() async {
    final dir = await getApplicationDocumentsDirectory(); // retourne un dossier privé à l'app où on peut stocker des fichiers
    return File('${dir.path}/activities.json');
  }

  // Charge la liste des activités
  Future<List<Activity>> loadActivities() async {
    try {
      File file = await _localFile(); // récupérer les activités du fichier local
      // Si le fichier n'existe pas encore, on le copie depuis les assets
      if (!await file.exists()) {
        final data = await rootBundle.loadString('assets/data/activities.json');
        await file.writeAsString(data); // on le copie dans le fichier local
      }

      String contents = await file.readAsString(); // lecturer fichier local
      final List<dynamic> jsonData = json.decode(contents);
      return jsonData.map((json) => Activity.fromJson(json)).toList(); // convertir chaque element json en object activity
    } catch (e) {
      print("Erreur chargement activités: $e");
      return [];
    }
  }

  // Ajoute une activité
  Future<void> addActivity(Activity activity) async {
    try {
      File file = await _localFile(); // récupérer fichier local
      List<Activity> activities = await loadActivities();
      activities.add(activity); // ajouter la nouvelle activité à la liste

      // Écriture dans le fichier
      final jsonString = json.encode(activities.map((a) => a.toJson()).toList());
      await file.writeAsString(jsonString);
    } catch (e) {
      print("Erreur ajout activité: $e");
    }
  }
}
