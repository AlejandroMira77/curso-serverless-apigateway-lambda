let numCounter = 0;
let text = '';

const counter = () => numCounter++;

exports.handler = async (event) => {
    if (numCounter == 0) {
        text = '❄️ Cold start';
        counter();
    } else {
      counter();
        text = '🔥 Warm start';
    }
    return {
        statusCode: 200,
        body: JSON.stringify({
            texto: text,
            contador: numCounter
        })
    }
}