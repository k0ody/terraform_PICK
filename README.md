## Provisionamento de Máquinas EC2 na AWS usando Terraform


Este repositório contém os arquivos necessários para provisiona 3 máquinas EC2 do tipo t2.medium na regiao us-east-1 (caso queira usar outro tipo de maquina e regiao, alterar dentro do arquivo variable.tf) na AWS utilizando o Terraform para a criação do cluster kubernetes (Day-5) do repositorio [Desconplicando Kubernetes PICK](https://github.com/k0ody/Descomplicando_Kubernetes). 


Siga as instruções abaixo para configurar e provisionar suas máquinas.

**Requisitos**

Antes de começar, certifique-se de ter os seguintes itens:

1. Conta na AWS com permissões para criar recursos EC2.

2. Chave de acesso e chave secreta da AWS para autenticar o Terraform.

3. Terraform instalado em sua máquina local. Para instruções de instalação, consulte a documentação oficial do Terraform.

**Configuração**

1. Clone o repositorio para seu ambiente local:

```
git@github.com:k0ody/terraform_PICK.git
```

2. Acesse o diretorio do projeto:

```
cd terraform_PICK
```

3. Configurando as credenciais:

Existe algumas formas de passar a credencial, nesse repositorio vou mostrar como passar a credencial por variavel de ambiente:

```
export AWS_ACCESS_KEY_ID="SUA_ACCESS_KEY_AQUI"
export AWS_SECRET_ACCESS_KEY="SUA_SECRET_KEY_AQUI"
```
Certifique-se de substituir SUA_ACCESS_KEY_AQUI e SUA_SECRET_KEY_AQUI pelas suas credenciais reais.

4. Backend na AWS:

O arquivo backend.tf, que esta comentado, contem as configurações necessarias para armazenar o state do terraform remotamente. Caso for usar colocar o nome do seu bucket 
na chave bucket e descomentar o bloco.

**Procedimento**

Siga estas etapas para provisionar as máquinas EC2:

1. Formate os arquivos de configuração do Terraform para seguir as convenções de estilo:

```
terraform fmt
```
2. Visualize as mudanças planejadas antes de aplicá-las:

```
terraform plan -out=<nome do plano>
```

3. Aplique as mudanças especificadas no plano anterior

```
terraform apply <nome do plano>
```

4. Após a conclusão da implantação, suas instâncias EC2 estarão disponíveis na AWS, e os IP's estarão disponiveis na saída do terminal.


**Limpeza**

Para evitar custos desnecessários, não se esqueça de destruir as instâncias EC2 após o uso:

```
terraform destroy
```