exports.handler = async (event) => {
    return {
        statusCode: 200,
        body: JSON.stringify({
            text: 'Hello world with ApiGateway and lambda',
            environmentVar: process.env.MY_ENVIRONMENTVAR
        })
    }
}