import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="doctor-dropdown"
export default class extends Controller {
  static targets = ["doctorSelect"];

  connect() {
    console.log("Connected to doctor dropdown controller");
    // console.log("doctorSelect = " + this.doctorSelectTarget);
  }

  // onChange() {
  //   const specializationId = this.element.value;
  //   console.log('Specialization ID:', specializationId);
  //   const doctorSelect = this.doctorSelectTarget;
  //   console.log('Doctor select:', doctorSelect);

    // Clear existing options in the doctor dropdown
  //   doctorSelect.innerHTML = '';

  //   if (specializationId) {
  //     fetch(`/specializations/${specializationId}/doctors`)
  //       .then(response => response.json())
  //       .then(doctors => {
  //         doctors.forEach(doctor => {
  //           const option = document.createElement('option');
  //           option.value = doctor.id;
  //           option.text = `${doctor.first_name} ${doctor.last_name}`;
  //           doctorSelect.appendChild(option);
  //         });
  //       })
  //       .catch(error => {
  //         console.error('Error fetching doctors:', error);
  //       });
  //   }
  // }

  onChange() {
    const specializationId = this.element.value;
        console.log('Specialization ID:', specializationId);
    const doctorSelect = this.doctorSelectTarget;
    const specializations = JSON.parse(this.data.get('specializations'));

    // Find the selected specialization
    const selectedSpecialization = specializations.find(spec => spec.id === parseInt(specializationId));

    if (selectedSpecialization) {
      fetch(`/specializations/${selectedSpecialization.id}/doctors`)
        .then(response => response.json())
        .then(doctors => {
          doctors.forEach(doctor => {
            const option = document.createElement('option');
            option.value = doctor.id;
            option.text = `${doctor.first_name} ${doctor.last_name}`;
            doctorSelect.appendChild(option);
          });
        })
        .catch(error => {
          console.error('Error fetching doctors:', error);
        });
    }
  }

}
