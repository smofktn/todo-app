import axios, { type AxiosInstance } from "axios";

const apiClient: AxiosInstance = axios.create({
  // APIのURI
  //baseURL: "http://localhost:18080", //TODO:環境変数を使用する
  // リクエストヘッダ
  headers: {
    "Content-type": "application/json",
  },
});

export default apiClient;
