public class DailyLeadPSce {
    public static void schedule() {
        DailyLeadProcessor p = new DailyLeadProcessor();
        String sch = '0 0 23 * * ? 2022';
        String jobId = System.schedule('Job ID', sch, p);
    }
}