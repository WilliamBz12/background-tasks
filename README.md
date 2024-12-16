![Mobile-Flutter: Trabalhando com background tasks](https://github.com/user-attachments/assets/446711ca-5740-4217-835c-e63a5065860d)

# Flutter: Trabalhando com background tasks
App de lista de tarefas para checagem do setor de compras de uma rede varejista

## 🔨 Funcionalidades do projeto
O App lista tarefas, permitindo adicioná-las e excluí-las, e funciona totalmente offline. Todo armazenamento é mantido no Couchbase.

## ✔️ Técnicas e tecnologias utilizadas
As técnicas e tecnologias utilizadas pra isso são:
- `Flutter`: Framework para desenvolvimento de apps multiplataforma (Android e iOS) com uso de widgets personalizados e gerenciamento de estado com Provider.
- `WorkManager`: Gerenciamento de tarefas em segundo plano, como sincronização automática e execução periódica de processos no app.
- `flutter_local_notifications`: Exibição de notificações locais, incluindo agendamento, notificações recorrentes e personalização de ações.
- `geolocator`: Acesso à localização do dispositivo e cálculo de distâncias para envio de notificações baseadas em proximidade.
- `Couchbase Lite`: Banco de dados local com suporte a sincronização bidirecional (offline-online), permitindo funcionamento mesmo sem internet.


## 📁 Acesso ao projeto
Você pode [acessar o código fonte do projeto inicial](https://github.com/WilliamBz12/background-tasks) ou [baixá-lo](https://github.com/WilliamBz12/background-tasks/archive/refs/heads/main.zip).

## 🛠️ Abrir e rodar o projeto
Após baixar o projeto, você pode abrir com o Visual Studio Code ou Android Studio. 

## 📚 Mais informações do curso
Gostou do projeto e quer conhecer mais? Você pode [acessar o curso](https://cursos.alura.com.br/course/flutter-implemente-offline-first-couchbase-app?utm_source=gnarus&utm_medium=timeline) que desenvolve o projeto desde o começo!
