const departamento = document.getElementById('departamento_empresa');
let option = departamento.querySelector('option[value=""]');
if (!departamentoUsuario || departamentoUsuario === 'None' || departamentoUsuario === '') {
    if (option) {
        option.text = 'seleccione departamento';
        option.selected = true;
    }
} else {
    // Busca si ya existe un option con ese valor
    option = departamento.querySelector(`option[value="${departamentoUsuario}"]`);
    if (!option) {
        // Si no existe, lo crea al inicio
        option = document.createElement('option');
        option.value = departamentoUsuario;
        departamento.prepend(option);
    }
    option.text = departamentoUsuario;
    option.selected = true;
}

// Lógica similar para ciudad_empresa
const ciudad = document.getElementById('ciudad_empresa');
let optionCiudad = ciudad.querySelector('option[value=""]');
if (!ciudadUsuario || ciudadUsuario === 'None' || ciudadUsuario === '') {
    if (optionCiudad) {
        optionCiudad.text = 'Seleccione una ciudad';
        optionCiudad.selected = true;
    }
} else {
    optionCiudad = ciudad.querySelector(`option[value="${ciudadUsuario}"]`);
    if (!optionCiudad) {
        optionCiudad = document.createElement('option');
        optionCiudad.value = ciudadUsuario;
        ciudad.prepend(optionCiudad);
    }
    optionCiudad.text = ciudadUsuario;
    optionCiudad.selected = true;
}
