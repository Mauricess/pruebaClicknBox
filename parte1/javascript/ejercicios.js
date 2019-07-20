/*
 * Función que devuelve la reversa de una cadena.
 * Su complejidad es lineal (n) dado que recorre la cadena una vez.
 */

function reversa(cadena){
    let rever = "";
    for(let i = cadena.length-1; i >= 0; i--){
        rever += cadena.charAt(i);
    }
    return rever;
}

var resp1 = reversa("abcd");
console.log(resp1);

/*
 * Función que devuelve la reversa de una cadena en el mismo objeto.
 * No se puede hacer ya que las cadenas se pasan como valores no referencias. 
 */

/*
function reversaM(cadena){
    let tam = cadena.length-1;
    let aux = "";

    for(let i = tam; i >= 0; i--){
        aux += cadena.charAt(i);
    }
    for(let o in cadena){
        cadena.o = aux.charAt(Number(o));
    }
    console.log(cadena);
    return cadena;
}

var original = "abcdefghijklmno";

reversaM(original);
console.log(original);*/

/*
 * Función fold sobre JSON
 */

const js1 = {};
// El ejemplo js2 dice que deben ser 2, pero solo una hoja cumple con ser número y que la llave sea distinta de bar
const js2 = { foo: { bar: 1 }, fooo: { bar: 4, foo: { foo: 1 } } };
const js3 = { foo: [{ bar: 1 }], bar: { bar: 4, foo: { foo: 1 } } };

foldJSON(js2);
console.log(js2);


function foldJSON(jsonOb){
    if(isJSON(jsonOb)){
        var c = traverse(jsonOb);
        for(member in jsonOb){
            delete jsonOb[member];
        }
        jsonOb["result"] = c;
    }
}

/*
 * Función que recorre el JSON y suma las ocurrencias de hojas que son números y cuyas llaves no son "bar"
 */


function traverse(jsonOb){
    var count = 0;
    if(isJSON(jsonOb)){
        Object.entries(jsonOb).forEach(([key, value]) => {
            if(typeof value == "number"){
                if(key !== "bar"){
                    count += 1;
                }
            }else{
                count += traverse(value);
            }
        });
    }else{
        throw "Parametro no valido";
    }
    return count;
}

/*
 * Función que revisa que el objeto este estructurado como un JSON
 */

function isJSON(jsonOb){
    return (jsonOb !== null && typeof jsonOb == "object" && !Array.isArray(jsonOb));
}


/*
 * Función que regresa la suma de los números anteriores de un número
 * Como solo se requiere hacer funciones básicas esta es constante sin depender del número que se pase.
 */

function numeroTrinagular(x){
    return x*(x+1)/2;
}

console.log(numeroTrinagular(5));
