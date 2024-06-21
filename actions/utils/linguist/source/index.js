const core = require('@actions/core');
const linguist = require('linguist-js');

async function run() {
  const path = core.getInput('path', { required: true });
  const { languages } = await linguist(path, { categories: ['programming'] });

  if (languages.count > 0) {
    const language = Object.entries(languages.results)
      .reduce((max, [key, value]) =>
          value.bytes > max.bytes ? { key, bytes: value.bytes } : max,
        { key: '', bytes: -1 }
      ).key.toLowerCase();
    core.setOutput('result', language);
  } else {
    throw 'No language detected';
  }
}

run().catch(error => core.setFailed(error.message));
