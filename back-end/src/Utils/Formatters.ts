export class Formatters {
    splitJson(json: String): any {
        const ajustJson = json.replace(/\}Conectado com\: 10\.10\.100\.29\<br\/\>/g,  '}');
        const removeLineBreak = ajustJson.split('\n').join('');
        const jsonFormatted = JSON.parse("{ \"result\": [" +  removeLineBreak + "] }");

        return jsonFormatted;
    }

    addNameSearchedToJson(json: any, nameSearched: string[]): any {
        var jsonFormatted = json;

        var i = 0;
        for (var item of jsonFormatted.result) {
            const name = nameSearched[i];
            jsonFormatted.result[i] = JSON.parse("{ \"Name Searched\": \"" + name + "\", \"result\": " +  JSON.stringify(item.result) + " }");
            i++;
        }

        return jsonFormatted;
    }
}