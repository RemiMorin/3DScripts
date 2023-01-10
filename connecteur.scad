
hauteur = 5;
largeur_externe = 2.5;
largeur_fil = 2.2;
$fn=40;
module connecteur(x,y){
    difference(){
        translate([-1,-1,0]) 
            cube([x*largeur_externe+2,y*largeur_externe+2,hauteur]);
        for(i = [1:1:x]) for(j = [1:1:y]){
            translate([
                (i*largeur_externe)-largeur_externe/2,
                 (j*largeur_externe)-largeur_externe/2,-1]) 
                cylinder(r1=largeur_fil/2,r2=0.7,h=hauteur+2);
        }
    }
}
connecteur(1,8);