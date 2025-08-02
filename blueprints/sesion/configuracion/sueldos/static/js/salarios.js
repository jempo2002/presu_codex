//funcion para cambiar el factor de una profesión
console.log('ingresando a salarios.js');
function manejarCambioFactor(input) {
    const factor = parseFloat(input.value);
    const fila = input.closest('tr');
    const tipo = fila.getAttribute('data-tipo');
    const profesion = fila.querySelector('td:first-child strong').textContent;
    
    // Calcular nuevo salario base basado en el factor
    const nuevoSalarioBase = Math.round(SALARIO_MINIMO * factor);
    
    // Actualizar el campo de salario base
    const salarioBaseInput = fila.querySelector('.salario-base-input');
    if (salarioBaseInput) {
        salarioBaseInput.value = nuevoSalarioBase.toLocaleString('es-CO');
    }
    
    // Recalcular prestaciones de esta fila específica
    calcularFilaPrestaciones(fila);
    
    // IMPORTANTE: Recalcular TODAS las especialidades cuando cambie oficial o ayudante
    setTimeout(() => {
        actualizarTodosLosGridsEspecialidades();
    }, 200);
    
    // Guardar automáticamente el factor de profesión
    guardarFactorProfesion(profesion, factor);
    
    console.log(`Factor de profesión ${profesion} cambiado a ${factor}, nuevo salario base: ${nuevoSalarioBase}`);
    console.log(`🔄 Actualizando todas las especialidades por cambio en ${tipo}`);
}