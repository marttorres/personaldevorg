public class ParkLocator {
    public static String[] country(String pais) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        String[] parksname = parks.byCountry(pais);
        
        System.debug('');
        return parksname;
    }
}