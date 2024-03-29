interface PedidoRequest {
  id?: number;
  clienteId:number;
  produtos: Productos[];
  endereco:Endereco
}

interface Productos {
  id?: number;
  quantidade?: number;
}
interface Endereco {
  id?: number;
  cep?: string;
  logradouro?: string;
  numero:number;
  complemento?: string;
  bairro?: string;
}

export default PedidoRequest;
