<div class="container film-requests-container" style="margin-top: 30px; margin-bottom: 50px; max-width: 1400px; padding: 0 15px;">
	<div class="row">
		<div class="col-md-12">
			<!-- Modern Header -->
			<div class="page-header-modern">
				<h1><i class="fa-solid fa-film"></i> {title}</h1>
				<p class="subtitle">Sevdiğiniz film ve dizileri isteyin, ekibimiz sizin için eklesin!</p>
			</div>

			<!-- Kalan İstek Hakkı -->
			{remaining_requests}

			<!-- Modern Arama Formu -->
			<div class="search-box-modern">
				<div class="search-header">
					<i class="fa-solid fa-magnifying-glass"></i>
					<h3>Film veya Dizi Ara</h3>
				</div>
				<div class="search-body">
					<p class="search-hint"><i class="fa-solid fa-lightbulb"></i> IMDb ID (örn: tt1234567) veya film/dizi adı ile arama yapabilirsiniz</p>

					<form method="post" action="">
						<!-- Arama Tipi Seçimi -->
						<div class="search-type-selector">
							<label class="type-option">
								<input type="radio" name="search_type" value="movie" {movie_checked}>
								<span class="type-badge type-movie">
									<i class="fa-solid fa-film"></i> Film
								</span>
							</label>
							<label class="type-option">
								<input type="radio" name="search_type" value="tv" {tv_checked}>
								<span class="type-badge type-tv">
									<i class="fa-solid fa-tv"></i> Dizi
								</span>
							</label>
						</div>

						<div class="search-input-group">
							<input type="text" name="query" class="search-input" placeholder="{search_placeholder}" required>
							<button class="search-btn" type="submit" name="search_film" value="submit">
								<i class="fa-solid fa-magnifying-glass"></i> {search_button}
							</button>
						</div>

						<!-- Captcha (Arama için - Misafirler) -->
						<div class="captcha-box-search">
							{captcha_html}
						</div>
					</form>
				</div>
			</div>

			<!-- Arama Mesajları -->
			{search_message}

			<!-- Arama Sonuçları -->
			[search_results]
			<div class="results-section-modern">
				<div class="results-header">
					<i class="fa-solid fa-list"></i>
					<h3>Arama Sonuçları</h3>
					<p>İstediğiniz içeriği bulun ve ekle butonuna tıklayın</p>
				</div>

				<!-- Captcha Uyarısı (Misafirler için) -->
				<div class="captcha-notice">
					{captcha_notice}
				</div>

				<div class="results-grid">
					{search_results}
				</div>

				<!-- Captcha Alanı (İstek eklemek için - Misafirler) -->
				<div class="captcha-box-request">
					{captcha_html_request}
				</div>
			</div>
			[/search_results]

			<!-- Beklemedeki İstekler -->
			[pending_requests]
			<div class="requests-section-modern pending-section">
				<div class="section-header">
					<i class="fa-solid fa-clock"></i>
					<h3>Beklemedeki İstekler</h3>
					<p>Kullanıcılar tarafından eklenen ve onay bekleyen içerikler</p>
				</div>
				<div class="section-body">
					<div class="table-responsive">
					{pending_requests}
					</div>
				</div>
			</div>
			[/pending_requests]

			<!-- Benim İsteklerim -->
			[my_requests]
			<div class="requests-section-modern my-requests-section">
				<div class="section-header">
					<i class="fa-solid fa-user"></i>
					<h3>Benim İsteklerim</h3>
					<p>Sizin tarafınızdan eklenen tüm istekler ve durumları</p>
				</div>
				<div class="section-body">
					<div class="table-responsive">
					{my_requests}
					</div>
				</div>
			</div>
			[/my_requests]
		</div>
	</div>
</div>

{recaptcha_script}

<script>
// Film istek formlarına captcha değerini ekle
document.addEventListener('DOMContentLoaded', function() {
	// Tüm film istek formlarını bul
	var requestForms = document.querySelectorAll('.film-request-form');

	requestForms.forEach(function(form) {
		form.addEventListener('submit', function(e) {
			// Onay dialogu
			if (!confirm('Bu içeriği istek listesine eklemek istiyor musunuz?')) {
				e.preventDefault();
				return false;
			}

			// Captcha değerini kontrol et ve ekle
			var captchaBoxRequest = document.querySelector('.captcha-box-request');

			if (captchaBoxRequest && captchaBoxRequest.innerHTML.trim() !== '') {
				// reCAPTCHA kontrolü
				var recaptchaResponse = captchaBoxRequest.querySelector('[name="g-recaptcha-response"]');
				if (recaptchaResponse) {
					var recaptchaValue = recaptchaResponse.value;
					if (!recaptchaValue) {
						alert('Lütfen güvenlik doğrulamasını tamamlayın!');
						e.preventDefault();
						return false;
					}
					// Form'a reCAPTCHA değerini ekle
					var input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'g-recaptcha-response';
					input.value = recaptchaValue;
					form.appendChild(input);
				}

				// Geleneksel captcha kontrolü
				var secCodeInput = captchaBoxRequest.querySelector('input[name="sec_code"]');
				if (secCodeInput) {
					var secCodeValue = secCodeInput.value;
					if (!secCodeValue) {
						alert('Lütfen güvenlik kodunu girin!');
						e.preventDefault();
						return false;
					}
					// Form'a sec_code değerini ekle
					var input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'sec_code';
					input.value = secCodeValue;
					form.appendChild(input);
				}
			}
		});
	});
});
</script>

<style>
/* ========== MODERN TASARIM - GENEL STİLLER ========== */
:root {
	--primary-color: #6366f1;
	--secondary-color: #8b5cf6;
	--success-color: #10b981;
	--warning-color: #f59e0b;
	--danger-color: #ef4444;
	--info-color: #3b82f6;
	--dark-color: #1f2937;
	--light-bg: #f9fafb;
	--border-color: #e5e7eb;
	--shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
	--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
	--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
	--shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
	--radius: 12px;
}

/* Container ayarları */
.film-requests-container {
	width: 100%;
	max-width: 1400px;
	margin-left: auto;
	margin-right: auto;
	box-sizing: border-box;
}

/* ========== MODERN HEADER ========== */
.page-header-modern {
	background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
	padding: 40px 30px;
	border-radius: var(--radius);
	color: white;
	margin-bottom: 30px;
	box-shadow: var(--shadow-lg);
	text-align: center;
}

.page-header-modern h1 {
	margin: 0;
	font-size: 2.5rem;
	font-weight: 700;
	text-shadow: 0 2px 4px rgba(0,0,0,0.2);
}

.page-header-modern .subtitle {
	margin: 10px 0 0 0;
	font-size: 1.1rem;
	opacity: 0.95;
	font-weight: 300;
}

/* ========== MODERN SEARCH BOX ========== */
.search-box-modern {
	background: white;
	border-radius: var(--radius);
	box-shadow: var(--shadow-md);
	margin-bottom: 30px;
	overflow: hidden;
	border: 1px solid var(--border-color);
}

.search-header {
	background: linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%);
	padding: 20px 30px;
	border-bottom: 2px solid var(--primary-color);
	display: flex;
	align-items: center;
	gap: 12px;
}

.search-header i {
	font-size: 1.5rem;
	color: var(--primary-color);
}

.search-header h3 {
	margin: 0;
	font-size: 1.4rem;
	font-weight: 600;
	color: var(--dark-color);
}

.search-body {
	padding: 30px;
}

.search-hint {
	color: #6b7280;
	font-size: 0.95rem;
	margin-bottom: 20px;
	display: flex;
	align-items: center;
	gap: 8px;
}

.search-hint i {
	color: var(--warning-color);
}

.search-type-selector {
	display: flex;
	gap: 15px;
	margin-bottom: 20px;
	justify-content: center;
}

.type-option {
	cursor: pointer;
	margin: 0;
}

.type-option input[type="radio"] {
	display: none;
}

.type-badge {
	display: inline-block;
	padding: 12px 30px;
	border-radius: 8px;
	font-weight: 600;
	transition: all 0.3s;
	border: 2px solid var(--border-color);
	background: white;
	color: #6b7280;
}

.type-option input[type="radio"]:checked + .type-badge.type-movie {
	background: linear-gradient(135deg, var(--primary-color), #4f46e5);
	color: white;
	border-color: var(--primary-color);
	box-shadow: var(--shadow-md);
	transform: translateY(-2px);
}

.type-option input[type="radio"]:checked + .type-badge.type-tv {
	background: linear-gradient(135deg, var(--info-color), #2563eb);
	color: white;
	border-color: var(--info-color);
	box-shadow: var(--shadow-md);
	transform: translateY(-2px);
}

.type-badge:hover {
	border-color: var(--primary-color);
	transform: translateY(-2px);
}

.search-input-group {
	display: flex;
	gap: 10px;
}

.search-input {
	flex: 1;
	padding: 15px 20px;
	font-size: 1.1rem;
	border: 2px solid var(--border-color);
	border-radius: 8px;
	transition: all 0.3s;
}

.search-input:focus {
	outline: none;
	border-color: var(--primary-color);
	box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
}

.search-btn {
	padding: 15px 30px;
	font-size: 1.1rem;
	font-weight: 600;
	background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: all 0.3s;
	white-space: nowrap;
}

.search-btn:hover {
	transform: translateY(-2px);
	box-shadow: var(--shadow-lg);
}

/* ========== RESULTS SECTION ========== */
.results-section-modern {
	background: white;
	border-radius: var(--radius);
	box-shadow: var(--shadow-md);
	margin-bottom: 30px;
	overflow: hidden;
	border: 1px solid var(--border-color);
}

.results-header {
	background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
	padding: 25px 30px;
	border-bottom: 2px solid var(--success-color);
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.results-header i {
	font-size: 2rem;
	color: var(--success-color);
	margin-bottom: 10px;
}

.results-header h3 {
	margin: 0;
	font-size: 1.5rem;
	font-weight: 600;
	color: var(--dark-color);
}

.results-header p {
	margin: 5px 0 0 0;
	color: #6b7280;
	font-size: 0.95rem;
}

/* ========== CAPTCHA SECTION ========== */
.captcha-box-search {
	background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
	border: 2px solid var(--warning-color);
	border-radius: 10px;
	padding: 25px;
	margin-top: 20px;
	text-align: center;
	box-shadow: var(--shadow-sm);
}

.captcha-box-search:empty {
	display: none;
}

.captcha-box-search::before {
	content: '🔒 Güvenlik Doğrulaması';
	display: block;
	font-weight: 700;
	font-size: 1rem;
	color: var(--dark-color);
	margin-bottom: 15px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.captcha-wrapper {
	display: inline-block;
}

.captcha-wrapper label {
	font-weight: 600;
	color: var(--dark-color);
	margin-bottom: 10px;
	display: block;
	font-size: 0.95rem;
}

.captcha-wrapper img {
	border: 2px solid var(--border-color);
	border-radius: 6px;
	box-shadow: var(--shadow-sm);
}

.captcha-wrapper input[type="text"] {
	margin-top: 10px;
}

.captcha-box-request {
	background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
	border: 2px solid var(--danger-color);
	border-radius: 10px;
	padding: 30px;
	margin: 20px;
	text-align: center;
	box-shadow: var(--shadow-md);
}

.captcha-box-request:empty {
	display: none;
}

.captcha-box-request::before {
	content: '🛡️ İstek Eklemek İçin Güvenlik Doğrulaması';
	display: block;
	font-weight: 700;
	font-size: 1.1rem;
	color: var(--dark-color);
	margin-bottom: 20px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.captcha-notice {
	margin: 0;
}

.captcha-notice:empty {
	display: none;
}

/* ========== RESULTS GRID ========== */
.results-grid {
	padding: 20px;
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 20px;
}

.movie-card {
	background: white;
	border-radius: 10px;
	overflow: hidden;
	transition: all 0.3s;
	border: 1px solid var(--border-color);
	display: flex;
	flex-direction: column;
}

.movie-card:hover {
	transform: translateY(-5px);
	box-shadow: var(--shadow-xl);
}

.movie-poster-col {
	position: relative;
	overflow: hidden;
}

.movie-poster {
	width: 100%;
	height: auto;
	display: block;
	transition: transform 0.3s;
}

.movie-poster:hover {
	transform: scale(1.05);
}

.no-poster {
	width: 100%;
	height: 300px;
	background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

.movie-badge {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 2;
	padding: 5px 12px;
	border-radius: 20px;
	font-size: 0.85rem;
	font-weight: 600;
	box-shadow: var(--shadow-md);
}

.movie-overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	background: linear-gradient(to top, rgba(0,0,0,0.9) 0%, transparent 100%);
	padding: 20px 15px;
	color: white;
	opacity: 0;
	transition: opacity 0.3s;
}

.movie-poster-col:hover .movie-overlay {
	opacity: 1;
}

.movie-overlay h5 {
	margin: 0 0 5px 0;
	font-size: 1rem;
	font-weight: 600;
}

.movie-overlay .movie-year {
	font-size: 0.9rem;
	opacity: 0.9;
}

.movie-info-col {
	padding: 15px;
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.movie-info-col h4 {
	font-size: 1rem;
	margin: 0;
	font-weight: 600;
	color: var(--dark-color);
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.movie-info-col p {
	margin: 0;
	font-size: 0.9rem;
}

.movie-info-col form {
	margin-top: auto;
}

/* ========== REQUESTS SECTIONS ========== */
.requests-section-modern {
	background: white;
	border-radius: var(--radius);
	box-shadow: var(--shadow-md);
	margin-bottom: 30px;
	overflow: hidden;
	border: 1px solid var(--border-color);
}

.section-header {
	padding: 25px 30px;
	border-bottom: 2px solid;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.pending-section .section-header {
	background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
	border-bottom-color: var(--warning-color);
}

.my-requests-section .section-header {
	background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
	border-bottom-color: var(--info-color);
}

.section-header i {
	font-size: 2rem;
	margin-bottom: 10px;
}

.pending-section .section-header i {
	color: var(--warning-color);
}

.my-requests-section .section-header i {
	color: var(--info-color);
}

.section-header h3 {
	margin: 0;
	font-size: 1.5rem;
	font-weight: 600;
	color: var(--dark-color);
}

.section-header p {
	margin: 5px 0 0 0;
	color: #6b7280;
	font-size: 0.95rem;
}

.section-body {
	padding: 20px;
}

/* ========== TABLE STİLLERİ ========== */
.film-request-table {
	width: 100%;
	border-collapse: collapse;
	background-color: white;
}

.film-request-table th,
.film-request-table td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid var(--border-color);
}

.film-request-table thead th {
	background: var(--light-bg);
	font-weight: 600;
	color: var(--dark-color);
	text-transform: uppercase;
	font-size: 0.85rem;
	letter-spacing: 0.5px;
}

.film-request-table tbody tr {
	transition: background 0.2s;
}

.film-request-table tbody tr:hover {
	background: var(--light-bg);
}

/* Admin Notu Stili */
.admin-note-text {
	display: block;
	margin-top: 8px;
	padding: 8px 12px;
	background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
	border-left: 3px solid var(--warning-color);
	border-radius: 4px;
	color: #92400e;
	font-size: 0.9rem;
	line-height: 1.4;
}

.admin-note-text i {
	margin-right: 5px;
}

.admin-note-text strong {
	color: #78350f;
}

/* Onaylı İstek Durumu Stili */
.status-note-approved {
	display: block;
	margin-top: 8px;
	padding: 10px 14px;
	background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
	border-left: 4px solid var(--success-color);
	border-radius: 6px;
	color: #065f46;
	font-size: 0.95rem;
	line-height: 1.4;
	box-shadow: 0 2px 4px rgba(16, 185, 129, 0.15);
}

.status-note-approved i {
	margin-right: 6px;
	color: var(--success-color);
	font-size: 1.1rem;
}

.status-note-approved strong {
	color: #047857;
}

/* Reddedilen İstek Durumu Stili */
.status-note-rejected {
	display: block;
	margin-top: 8px;
	padding: 10px 14px;
	background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
	border-left: 4px solid var(--danger-color);
	border-radius: 6px;
	color: #991b1b;
	font-size: 0.95rem;
	line-height: 1.5;
	box-shadow: 0 2px 4px rgba(239, 68, 68, 0.15);
}

.status-note-rejected i {
	margin-right: 6px;
	color: var(--danger-color);
	font-size: 1.1rem;
}

.status-note-rejected strong {
	color: #7f1d1d;
}

/* Red Sebebi Metni */
.rejection-reason {
	display: block;
	margin-top: 6px;
	padding-top: 6px;
	border-top: 1px solid rgba(127, 29, 29, 0.2);
	color: #7f1d1d;
	font-size: 0.9rem;
	font-style: italic;
}

/* ========== RESPONSIVE ========== */
@media (max-width: 1200px) {
	.results-grid {
		grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
	}
}

@media (max-width: 992px) {
	.results-grid {
		grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
	}

	.page-header-modern h1 {
		font-size: 2rem;
	}
}

@media (max-width: 768px) {
	/* Grid ve kartlar */
	.results-grid {
		grid-template-columns: repeat(2, 1fr);
		gap: 15px;
	}

	/* Arama formu */
	.search-input-group {
		flex-direction: column;
	}

	.search-btn {
		width: 100%;
	}

	.search-type-selector {
		flex-direction: column;
		gap: 10px;
	}

	.type-badge {
		width: 100%;
		text-align: center;
	}

	/* Header */
	.page-header-modern {
		padding: 30px 20px;
	}

	.page-header-modern h1 {
		font-size: 1.75rem;
	}

	/* Tablolar - Mobil için özel tasarım */
	.film-request-table {
		font-size: 0.85rem;
	}

	.film-request-table thead {
		display: none;
	}

	.film-request-table tbody tr {
		display: block;
		margin-bottom: 20px;
		border: 2px solid var(--border-color);
		border-radius: 8px;
		padding: 15px;
		background: white;
		box-shadow: var(--shadow-sm);
	}

	.film-request-table tbody td {
		display: block;
		text-align: left !important;
		border: none;
		padding: 8px 0;
	}

	.film-request-table tbody td::before {
		content: attr(data-label);
		font-weight: bold;
		display: inline-block;
		margin-right: 10px;
		color: var(--dark-color);
		min-width: 80px;
	}

	.film-request-table tbody td:first-child {
		text-align: center !important;
		margin-bottom: 10px;
	}

	.film-request-table tbody td:first-child::before {
		content: '';
		display: none;
	}

	.film-request-table tbody td img {
		max-width: 120px !important;
		height: auto;
		margin: 0 auto;
		display: block;
	}
}

@media (max-width: 576px) {
	/* Container */
	.film-requests-container {
		padding: 0 10px;
		margin-top: 20px;
	}

	/* Tek sütun */
	.results-grid {
		grid-template-columns: 1fr;
	}

	.search-body {
		padding: 20px;
	}

	.section-body {
		padding: 15px;
	}

	.page-header-modern {
		padding: 25px 15px;
	}

	.page-header-modern h1 {
		font-size: 1.5rem;
	}

	.page-header-modern .subtitle {
		font-size: 0.95rem;
	}

	/* Captcha kutuları */
	.captcha-box-search,
	.captcha-box-request {
		padding: 20px 15px;
	}

	.captcha-box-search::before,
	.captcha-box-request::before {
		font-size: 0.9rem;
	}

	/* Alert mesajları */
	.alert {
		padding: 12px 15px;
		font-size: 0.9rem;
	}

	/* Durum notları */
	.admin-note-text,
	.status-note-approved,
	.status-note-rejected {
		padding: 8px 10px;
		font-size: 0.85rem;
	}

	/* Tablolar - Ekstra küçük ekranlar */
	.film-request-table {
		font-size: 0.8rem;
	}

	.film-request-table tbody tr {
		padding: 12px;
	}

	.film-request-table tbody td {
		padding: 6px 0;
	}

	.film-request-table tbody td::before {
		display: block;
		margin-bottom: 5px;
	}
}

/* ========== ALERT STİLLERİ ========== */
.alert {
	padding: 15px 20px;
	border-radius: 8px;
	margin-bottom: 20px;
	border-left: 4px solid;
}

.alert-info {
	background: #dbeafe;
	border-color: var(--info-color);
	color: #1e40af;
}

.alert-success {
	background: #d1fae5;
	border-color: var(--success-color);
	color: #065f46;
}

.alert-warning {
	background: #fef3c7;
	border-color: var(--warning-color);
	color: #92400e;
}

.alert-danger {
	background: #fee2e2;
	border-color: var(--danger-color);
	color: #991b1b;
}
</style>