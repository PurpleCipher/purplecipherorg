const axios = require('axios');

const {WEBHOOK_URL: webhookUrl, CR_PAT: token, APP_NAME: appName, VERSION: version} = process.env;

const dispatch = async (payload) => {
    const response = await axios.post(webhookUrl, {...payload}, {
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/vnd.github.v3+json',
            'Authorization': `token ${token}`
        }
    });
    return response.status;
}

function run() {
    const payload = {
        client_payload: {
            name: appName,
            version: version
        },
        'event_type': 'update-image'
    };

    dispatch(payload).then(console.log).catch(e => console.error(e.message)).finally(() => process.exit(0));
}

run();
