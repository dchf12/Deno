import { Octokit as OctokitCore } from 'https://cdn.skypack.dev/@octokit/core?dts';

export const Octokit = OctokitCore.plugin(restEndpointMethods);

const octokit = new Octokit();
const commits = await octokit.request('GET /repos/dchf12/dchf12/commits',{
	owner: 'dchf12',
	repo: 'dchf12'
});

console.log(commits.data.length);
