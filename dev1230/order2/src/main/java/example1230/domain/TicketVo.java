package example1230.domain;

public class TicketVo {
    private String name;
    private String tel;
    private String list;
    private int count;

    public TicketVo() {
    }

    public TicketVo(String name, String tel, String list, int count) {
        this.name = name;
        this.tel = tel;
        this.list = list;
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getList() {
        return list;
    }

    public void setList(String list) {
        this.list = list;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
