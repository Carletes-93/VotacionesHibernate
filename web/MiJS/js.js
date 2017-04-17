function cerrarEscrutinio() {
    document.getElementById('alta').setAttribute('disabled', 'disabled');
    document.getElementById('baja').setAttribute('disabled', 'disabled');
    document.getElementById('votar').setAttribute('disabled', 'disabled');
    document.getElementById('result').setAttribute('disabled', 'disabled');

    document.getElementById('nif').removeAttribute('required');
    document.getElementById('pass').removeAttribute('required');
    document.getElementById('nif').setAttribute('disabled', 'disabled');
    document.getElementById('pass').setAttribute('disabled', 'disabled');

    document.getElementById('result').removeAttribute('disabled');
    document.getElementById('result').removeAttribute('style');
}