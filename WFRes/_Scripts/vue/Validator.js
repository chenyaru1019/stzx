$(function () {
    Vue.validator('number', function (val) {
        return /^[+]?[0-9]+$/.test(val);
    });

    Vue.validator('space', function (val) {
        return /^\S*$/.test(val);
    });
})