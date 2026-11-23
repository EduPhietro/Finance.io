
import { Link } from 'react-router'
import './LandingPage.css'

function LandingPage() {
  return (
    <div className="landing">
      <header className="landing-header">
        <Link to="/" className="landing-logo">
          <span className="landing-logo-icon">F</span>
          <span>Finance.io</span>
        </Link>

        <nav className="landing-nav" aria-label="Navegação principal">
          <a href="#recursos">Recursos</a>
          <a href="#como-funciona">Como funciona</a>
          <a href="#sobre">Sobre</a>
        </nav>

        <div className="landing-header-actions">
          <Link to="/login" className="landing-login">
            Entrar
          </Link>
          <Link to="/cadastro" className="landing-button landing-button-small">
            Criar conta
          </Link>
        </div>
      </header>

      <main>
        <section className="landing-hero">
          <div className="landing-container landing-hero-grid">
            <div className="landing-hero-content">
              <span className="landing-eyebrow">
                CONTROLE FINANCEIRO SEM COMPLICAÇÃO
              </span>

              <h1>Seu dinheiro, mais claro.</h1>

              <p>
                Registre receitas e despesas, acompanhe contas e cartões
                e tome decisões com uma visão real da sua vida financeira.
              </p>

              <div className="landing-hero-actions">
                <Link to="/cadastro" className="landing-button">
                  Criar conta grátis
                </Link>
                <a href="#recursos" className="landing-text-link">
                  Conhecer recursos →
                </a>
              </div>

              <small>Organize suas finanças em poucos minutos.</small>
            </div>

            <div className="landing-preview">
              <div className="landing-preview-top">
                <div>
                  <span>Visão geral</span>
                  <small>Resumo das suas finanças</small>
                </div>
                <span className="landing-preview-tag">Exemplo visual</span>
              </div>

              <div className="landing-preview-grid">
                <div className="landing-preview-balance">
                  <span>Saldo total</span>
                  <strong>R$ 24.580,00</strong>
                  <small>Visão consolidada</small>

                  <div className="landing-chart" aria-hidden="true">
                    {[35, 55, 43, 68, 50, 75, 61, 89].map((value, index) => (
                      <span
                        key={index}
                        style={{ height: `${value}%` }}
                      />
                    ))}
                  </div>
                </div>

                <div className="landing-preview-stats">
                  <div className="landing-stat landing-stat-income">
                    <span>Receitas</span>
                    <strong>R$ 8.450</strong>
                  </div>
                  <div className="landing-stat">
                    <span>Despesas</span>
                    <strong>R$ 4.920</strong>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="landing-features" id="recursos">
          <div className="landing-container">
            <div className="landing-highlights">
              <span>✦ Claro e simples</span>
              <span>✦ Receitas e despesas</span>
              <span>✦ Contas e cartões</span>
              <span>✦ Visão consolidada</span>
            </div>

            <span className="landing-eyebrow">CONTROLE PARA SUA VIDA</span>
            <h2>Organize sua vida financeira sem complicação.</h2>
            <p className="landing-section-description">
              Uma experiência simples para registrar, entender e planejar
              melhor as suas finanças.
            </p>

            <div className="landing-feature-grid">
              <article className="landing-feature-card">
                <span className="landing-feature-icon">◎</span>
                <h3>Tudo em um só lugar</h3>
                <p>
                  Acompanhe suas informações financeiras em uma
                  única plataforma.
                </p>
              </article>

              <article className="landing-feature-card">
                <span className="landing-feature-icon">▤</span>
                <h3>Movimentações organizadas</h3>
                <p>
                  Registre receitas e despesas com categorias
                  para facilitar o acompanhamento.
                </p>
              </article>

              <article className="landing-feature-card">
                <span className="landing-feature-icon">◷</span>
                <h3>Planeje o que vem pela frente</h3>
                <p>
                  Tenha uma visão mais clara das suas contas
                  e movimentações financeiras.
                </p>
              </article>
            </div>
          </div>
        </section>

        <section className="landing-steps" id="como-funciona">
          <div className="landing-container">
            <span className="landing-eyebrow">COMO FUNCIONA</span>
            <h2>Comece em poucos minutos.</h2>
            <p className="landing-section-description">
              Seu controle financeiro começa com três passos simples.
            </p>

            <div className="landing-steps-grid">
              <article>
                <span className="landing-step-number">1</span>
                <div>
                  <h3>Crie sua conta</h3>
                  <p>Cadastre-se para começar a organizar suas finanças.</p>
                </div>
              </article>

              <article>
                <span className="landing-step-number">2</span>
                <div>
                  <h3>Registre movimentações</h3>
                  <p>Adicione suas receitas, despesas e categorias.</p>
                </div>
              </article>

              <article>
                <span className="landing-step-number">3</span>
                <div>
                  <h3>Acompanhe sua evolução</h3>
                  <p>Visualize suas informações financeiras no dashboard.</p>
                </div>
              </article>
            </div>
          </div>
        </section>

        <section className="landing-about" id="sobre">
          <div className="landing-container">
            <div className="landing-cta">
              <div>
                <h2>Clareza para cuidar do seu dinheiro.</h2>
                <p>
                  Dê o primeiro passo para uma vida financeira
                  mais organizada.
                </p>
              </div>
              <Link to="/cadastro" className="landing-cta-button">
                Criar minha conta
              </Link>
            </div>
          </div>
        </section>
      </main>

      <footer className="landing-footer">
        <div className="landing-container landing-footer-main">
          <div>
            <Link to="/" className="landing-logo">
              <span className="landing-logo-icon">F</span>
              <span>Finance.io</span>
            </Link>
            <p>Organização, simplicidade e controle financeiro.</p>
          </div>

          <nav aria-label="Navegação do rodapé">
            <a href="#recursos">Recursos</a>
            <a href="#como-funciona">Como funciona</a>
            <Link to="/login">Entrar</Link>
          </nav>
        </div>

        <div className="landing-container landing-footer-bottom">
          <span>© {new Date().getFullYear()} Finance.io</span>
          <span>Projeto Finance.io</span>
        </div>
      </footer>
    </div>
  )
}

export default LandingPage
