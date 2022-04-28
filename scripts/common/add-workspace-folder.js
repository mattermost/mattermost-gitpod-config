const fs = require('fs');

(async () => {
    const fname = '/workspace/mattermost-gitpod-config/mattermost.code-workspace';
    const b = await fs.promises.readFile(fname, {encoding: 'utf8', flag: 'r'});
    const workspace = JSON.parse(b);

    const folderName = process.argv[2];
    const folderPath = '../' + folderName;

    if (workspace.folders.find(f => f.path === folderPath)) {
        console.log(`Folder ${folderName} is already in workspace.`)
        process.exit(0);
    }

    workspace.folders.push({path: folderPath});

    const out = JSON.stringify(workspace, null, 4) + '\n';
    fs.promises.writeFile(fname, out);
})();
