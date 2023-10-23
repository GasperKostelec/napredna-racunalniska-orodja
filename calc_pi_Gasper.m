function calc_pi_Gasper()
% na podlagi začetnega števila točk, radija in naknadnih povečanj začetnih
% točk, izpiše izračunano vrednost π in napako oz. odstopanje od števila π, ki je shranjeno v Matlabu kot \pi.
    n = 100;
    r = 1;
    raziskuje_priblizke_pi(n, r);
end

function raziskuje_priblizke_pi(n, r)
    stevilo_priblizkov = 4; % Število kolikokrat naj poveča in ponovi korak
    for i = 1:stevilo_priblizkov
        [ocenaPi, napaka] = area_pi(n, r);
        disp(['Število naključnih točk: ', num2str(n)]);
        disp(['Ocenjena vrednost π: ', num2str(ocenaPi)]);
        disp(['Napaka oz. odstopanje od števila π: ', num2str(napaka)]);
        izrisi_graf(n, r, ocenaPi);
        n = n * 10; % Poveča število naključnih točk za naslednji poskus
    end
end

function [ocenaPi, napaka] = area_pi(n, r)
% izračuna vrednosti Pi in določi absolutno napako
    zn_Kroga = 0;
    for i = 1:n
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;
        if x^2 + y^2 <= r^2
            zn_Kroga = zn_Kroga + 1;
        end
    end
    ocenaPi = 4 * zn_Kroga / n;
    napaka = abs(ocenaPi - pi);
end

function izrisi_graf(n, r, ocenaPi)
  % Ustvari nov graf za vsak približek in doda legendo zraven njega
    figure;
    izrisi_tocke(n, r);
    izrisi_kroznico(r);
    title(['Ocenjena vrednost π: ', num2str(ocenaPi)]);
    xlabel('X-os');
    ylabel('Y-os');
    legend('Znotraj krožnice', 'Zunaj krožnice', 'Krožnica','Location','northeastoutside')
end

function izrisi_tocke(n, r)
%določi točke zunaj in znotraj kroga ter jih doda na graf
    x = 2 * rand(n, 1) - 1;
    y = 2 * rand(n, 1) - 1;
    razdalja = sqrt(x.^2 + y.^2);
    tockeZn = razdalja <= r;
    tockeZu = razdalja > r;
    scatter(x(tockeZn), y(tockeZn), 30, 'cyan', '.');
    hold on;
    scatter(x(tockeZu), y(tockeZu), 10, 'magenta', '^');
    axis equal;
end

function izrisi_kroznico(r)
    theta = linspace(0, 2 * pi, 1000);
    x = r * cos(theta);
    y = r * sin(theta);
    plot(x, y, 'red', 'LineWidth', 2.8, 'LineStyle','-.');
end
