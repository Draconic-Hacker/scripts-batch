# 1. Carrega a DLL de onde ela foi instalada
$dllPath = Join-Path $HOME "browser-files\Microsoft.Web.WebView2.WinForms.dll"
Add-Type -Path $dllPath

# 2. Agora sim o PowerShell entende o que é o WebView2
Add-Type -AssemblyName System.Windows.Forms
$webView = New-Object Microsoft.Web.WebView2.WinForms.WebView2

# 1. Carrega as bibliotecas necessárias
Add-Type -AssemblyName System.Drawing

# 2. Cria a Janela Principal (o "container")
$form = New-Object System.Windows.Forms.Form
$form.Text = "Meu Navegador Moderno"
$form.Size = New-Object System.Drawing.Size(600, 400)
$form.StartPosition = "CenterScreen"

# 3. Cria o controle do WebView2
# Nota: O Windows 10/11 já costuma ter o Runtime do WebView2 instalado
$webView.Dock = [System.Windows.Forms.DockStyle]::Fill

# 4. O seu HTML e CSS (O "Visual")
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #1e1e1e; color: white; display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; margin: 0; }
        h1 { color: #0078d4; }
        .btn { background: #0078d4; border: none; color: white; padding: 10px 20px; cursor: pointer; border-radius: 5px; transition: 0.3s; }
        .btn:hover { background: #005a9e; }
        #status { margin-top: 20px; color: #107c10; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Projeto Browser-Files</h1>
    <p>Interface moderna com HTML e CSS</p>
    <button class="btn" onclick="window.chrome.webview.postMessage('listar')">Testar Comunicação</button>
    <div id="status"></div>

    <script>
        // Ouve mensagens vindas do PowerShell
        window.chrome.webview.addEventListener('message', event => {
            document.getElementById('status').innerText = event.data;
        });
    </script>
</body>
</html>
"@

# 5. Lógica de inicialização e comunicação
$form.Add_Load({
    $webView.EnsureCoreWebView2Async($null)
})

# Evento: O que acontece quando o WebView2 termina de carregar?
$webView.add_CoreWebView2InitializationCompleted({
    $webView.CoreWebView2.NavigateToString($htmlContent)
})

# Evento: Receber clique do botão HTML no PowerShell
$webView.add_WebMessageReceived({
    param($sender, $args)
    $mensagem = $args.TryGetWebMessageAsString()
    
    if ($mensagem -eq "listar") {
        # O PowerShell processa algo e manda de volta para o HTML
        $data = Get-Date -Format "HH:mm:ss"
        $webView.CoreWebView2.PostWebMessageAsString("Botão clicado às $data ! O PowerShell respondeu.")
    }
})

# 6. Adiciona o navegador na janela e exibe
$form.Controls.Add($webView)
$form.ShowDialog()
