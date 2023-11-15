import fetch from 'node-fetch'
import { schedule } from '@netlify/functions'

// Get the build hook from ENV
const BUILD_HOOK = process.env.BUILD_HOOK

// Schedules the handler function to run every 12 hours
const handler = schedule('0 */12 * * *', async () => {
  if (!BUILD_HOOK) {
    console.log('Skipping, no build hook defined')
    return;
  }
  await fetch(BUILD_HOOK, {
    method: 'POST'
  }).then(response => {
    console.log('Build hook response:', response)
  })

  return {
    statusCode: 200
  }
})

export { handler }