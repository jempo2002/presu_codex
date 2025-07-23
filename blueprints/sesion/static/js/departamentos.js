console.log('ingresando a departamentos.js');

function ciudades_del_departamento(inputId, selectId) {
    console.log('Inicializando ciudades del departamento:', inputId, selectId);
    let input = document.getElementById(inputId);
    input.addEventListener('change', event => {
        input.value = event.target.value;
        fetch(`${urlGetMunicipios}?departamento=${encodeURIComponent(input.value)}`)
            .then(response => response.json())
            .then(data => {
                let ciudadFiltrada = document.getElementById(selectId);
                ciudadFiltrada.innerHTML = '<option disabled selected>Seleccione una ciudad</option>';
                try {
                    let muni = data.municipios;
                    for (let i = 0; i < muni.length; i++) {
                        let option = document.createElement('option');
                        option.value = muni[i];
                        option.textContent = muni[i];
                        ciudadFiltrada.appendChild(option);
                    }
                } catch (e) {
                    console.error('Error processing data:', e);
                }
            })
            .catch(error => console.error('Error:', error));
    });
}



ciudades_del_departamento('departamento_empresa', 'ciudad_empresa');