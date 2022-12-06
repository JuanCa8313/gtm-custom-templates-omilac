___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Lookup Url - Function",
  "description": "Use a function with an specefic values when url is validated",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "functionVar",
    "displayName": "Function to use",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "functionRegexValidator",
    "displayName": "Function Regex Validator",
    "simpleValueType": true
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "array",
    "displayName": "Information",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Regex Url",
        "name": "regexUrl",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "defaultValue": "",
        "displayName": "Inputs",
        "name": "inputs",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

/**
  Autor: Juan Camilo Arcila Velasquez.
  Year: 2022
  LinkedIn: https://www.linkedin.com/in/juan-camilo-arcila-vel%C3%A1squez-0515a2241/
**/

// Introduzca aquí su código de plantilla.
const log = require('logToConsole');
const getUrl = require('getUrl');
//log('data =', data);
//log('data function =', (typeof data.functionVar));
//log('data array 1 =', (typeof data.array[0].inputs));
//log('data array =', data.array);
//log('data function regex =', typeof data.functionRegexValidator);

const functionRegex = data.functionRegexValidator;
const arr = data.array;
const functionVar = data.functionVar;
const path = getUrl('path');
var result;

//log('data regex validator =', functionRegex('prueba', path));

//log('data url =', path);

function getArrays(item) {
  //log('data url regex =', item.regexUrl);
  //log('data page var =', path);
  if(functionRegex(item.regexUrl, path)){
  //if ((item.regexUrl) == (path)){ // Important to change condition
    var css_contents = item.inputs[0], texts_content = item.inputs[1];
    //log('data css contents =', css_contents);
    return functionVar(css_contents, texts_content);
  }
}

if ('undefined' != typeof arr) {
  result = (arr.map(getArrays))[0];
}

return result;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: "const mockData = {\n  functionVar: (entry,comp) => {\n  \treturn 'hola';\n\
    \  },\n  functionRegexValidator: (entry,comp) => {\n  \treturn entry.match(comp);\n\
    \  },\n  array:[\n    {regexUrl:\"/js_sandbox_v2.html\",\n     inputs:[\n    \
    \   [\"section#modulo-productos a, section#modulo-productos a *\",\"#calle-salida-fija-imagen\
    \ > div.cards-container > div > div > a, #calle-salida-fija-imagen > div.cards-container\
    \ > div > div > a *\"],\n       [\"valor 1\",\"valor 2\"]\n     ]}]\n};\n\n//\
    \ Call runCode to run the template's code.\nlet variableResult = runCode(mockData);\n\
    \n// Verify that the variable returns a result.\nassertThat(variableResult).isNotEqualTo(undefined);"


___NOTES___

Created on 6/12/2022, 10:29:25


