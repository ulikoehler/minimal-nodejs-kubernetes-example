const Koa = require('koa');
const app = new Koa();

app.use(async ctx => {
  ctx.body = {status: 'success'};
});

app.listen(9093);