import http from 'k6/http';
import { sleep, check } from 'k6';

const app1BaseUrl='http://localhost:10231'

const authToken='eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJXbklHMmdSc0o1SlZKaGdoNl92amFoTlBja0VsS0FNcVNOWVJlTFVkWkJFIn0.eyJleHAiOjE2NjU5MjA2NzEsImlhdCI6MTY2NTkxOTIzMSwianRpIjoiN2Q0OWQwYzMtZjVkNS00Y2JhLTk0YzYtZTEyMTRlMmY4MDg3IiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo5MDg1L3JlYWxtcy9iZW5jaG1hcmsiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiYjg0Nzk2MGYtZWZhYy00ODQ3LTkyNTItYzg0Y2QzNDE2NDQxIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYXBpIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJkZWZhdWx0LXJvbGVzLWJlbmNobWFyayIsIm9mZmxpbmVfYWNjZXNzIiwidW1hX2F1dGhvcml6YXRpb24iXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJjbGllbnRIb3N0IjoiMTcyLjE4LjAuMSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiY2xpZW50SWQiOiJhcGkiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY291bnQtYXBpIiwiY2xpZW50QWRkcmVzcyI6IjE3Mi4xOC4wLjEifQ.yrtkbZOmzLpkBHxCwRuLla8PAJrCvw5_EXUpDcZfjMIGcOmal910485sdvT0fGmNsBbzzYbPiwdkmFrSsl_0fIFZIdxhHGctCnKGUmUVC2jpWJfy3VNR4YNSyAjYR7wk3wUt-p1Kt59TyF44OXSZGus9f8iMwrYqkfpdRAZ_OPRcUNCIQTHboXzHcjGw7VdPWQ_K-NYDCHrMFPDkza96fYAD_k1CVF8zugCCiShczzWuGXpwpvH_H1tAaEmboeYAxbQCsaYP6bwg6G1f6i-FOqPd_6qkppo_3BI5Zxjlp6nfnEP6psAnNMF8c-Hb5xM-OB3GWVX9e6JpLvpRqsThFA'
const params = {
  headers: {
    'Authorization': 'Bearer ' + authToken,
  },
};


export default function () {
  let r = Math.floor(Math.random() * 1000) + 1;
  const res = http.get(`${app1BaseUrl}/api/main`, params);
  check(res, {
    'is status 200': (res) => res.status === 200,
    'body size is > 0': (r) => r.body.length > 0,
  });
  // sleep(1);
}