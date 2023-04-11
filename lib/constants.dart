import 'package:flutter/material.dart';
import 'package:skealth/screens/doctor_details.dart';

const Color primaryColor = Color(0xFFF7FFF7);
const Color secondaryColor = Color(0xFF4ECDC4);
const Color textColor = Color(0xFF292F36);
const Color errorColor = Color(0xFFFF6B6B);
const Color warningColor = Color(0xFFFFE66D);

class Prediction {
  String name;
  String confidence;
  int index;

  Prediction(int index, String name, String confidence) {
    this.index = index;
    this.name = name;
    this.confidence = confidence;
  }
}

class DiseaseInfo {
  String name;
  String description;
  List<String> symptoms;
  double severity;
  String image;

  DiseaseInfo(this.name, this.description, this.symptoms, this.severity,
      this.image);
}

List<DiseaseInfo> diseaseInfo = [
  DiseaseInfo(" Actinic keratoses",
      "A rough, scaly area of skin called an actinic keratosis appears as a result of prolonged sun exposure.",
      [
        "Rough, dry or scaly patch of skin, usually less than 1 inch (2.5 centimeters) in diameter",
        "Flat to slightly raised patch or bump on the top layer of skin",
        "In some cases, a hard, wartlike surface"
      ], 3.0, "assets/images/AK.jpg"),
  DiseaseInfo("Basal cell carcinoma",
      "Basal cell carcinoma is a type of skin cancer. Basal cell carcinoma often appears as a slightly transparent bump on the skin, though it can take other forms.Basal cell carcinoma (BCC) is the most common form of skin cancer.",
      [
        "A shiny, skin-colored bump",
        "A brown, black or blue lesion",
        "A flat, scaly patch"
      ], 4.0, "assets/images/BCC.jpg"),
  DiseaseInfo("Benign keratosis-like lesions",
      "Seborrheic keratoses are noncancerous (benign) skin growths that some people develop as they age.People tend to get more of them as they get older.",
      [
        "A round or oval-shaped waxy or rough bump",
        "Light tan to brown or black in color"
      ], 1.0, "assets/images/keratosis.jpg"),
  DiseaseInfo("Dermatofibroma",
      "Dermatofibromas (DFs) are common benign cutaneous tumors.These are mostly seen in adults. DFs usually occur as solitary lesions on the extremities.",
      [
        "The nodule is usually asymptomatic but can be itchy or tender",
        "After initial growth, they tend to remain static in size"
      ], 1.0, "assets/images/dermatofibroma.jpg"),
  DiseaseInfo("Melanocytic nevi",
      " Melanocytic nevus is usually a noncancerous condition of pigment-producing skin cells. It is a type of melanocytic tumor that contains nevus cells.[",
      ["Asymmetric, indistinct or irregularly bordered variably colored papules with diameter >5 mm", "History of change in shape and color *asymptomatic (usually)"], 2.0,
      "assets/images/menevi.jpg"),
  DiseaseInfo("Vascular lesions",
      "Vascular lesions are relatively common abnormalities of the skin and underlying tissues, more commonly known as birthmarks.",
      ["Usually appear at birth", "Darken over timeto become deep in color"],
      1.0, "assets/images/vl.jpg"),
  DiseaseInfo("Melanoma",
      "Melanoma is a disease in which malignant (cancer) cells form in melanocytes (cells that color the skin). Melanoma can occur anywhere on the skin and can also form in your eyes and, rarely, inside your body, such as in your nose or throat. Unusual moles, exposure to sunlight, and health history can affect the risk of melanoma.",
      ["Asymmetric, distinct or irregularly bordered", "The spot is larger than 6 millimeters across"], 4.0, "assets/images/melanoma.jpg"),
];


class DoctorInfo {
  String name;
  String qualification;
  String image;
  String contact;
  String location;
  String hours;

  DoctorInfo(
      this.name,
      this.qualification,
      this.image,
      this.contact,
      this.location,
      this.hours,
      );
}

List<DoctorInfo> doctors = [
  DoctorInfo(
      "Dr. Gauri Gupta", "PHD, MBBS", "assets/images/lady.jpg", "1234567890",
      "Bhagwati Hospital", "11 AM - 5 PM"),
  DoctorInfo(
      "Dr. Dinesh Grover", "PHD, MD", "assets/images/man.jpg", "9876543210",
      "Maheshwari Hospital", "9 AM - 3 PM"),
];
