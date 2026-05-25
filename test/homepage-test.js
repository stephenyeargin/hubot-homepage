const test = require('node:test');
const assert = require('node:assert/strict');
const { createTestBot } = require('./common/TestBot');

test('shows a home page', async () => {
  const ctx = await createTestBot();
  try {
    const res = await fetch(`http://127.0.0.1:${process.env.PORT || 18080}/`);
    assert.equal(res.status, 200);
    const text = await res.text();
    assert.ok(text.includes('octodex.github.com'));
  } finally {
    ctx.shutdown();
  }
});
